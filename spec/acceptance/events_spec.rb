# -*- coding: utf-8 -*-
require 'spec_helper'
require 'acceptance/shared_context/events'
require 'acceptance/shared_example/events'

feature 'イベントの作成' do
  let(:account ) { Fabricate :user_account, type: UserAccount::UserType[:admin] }

  background 'ログインしてイベント新規作成画面を表示している' do
    login_as(account)
    visit new_event_path
  end

  scenario 'ステージがひとつの場合は削除できない' do
    page.should have_css('.stage', count: 1)
    page.should have_css('.stage_delete', visible: false)
  end

  scenario 'イベントを作成できる', js: true do
    page.fill_in 'event_schedule', with: '2011/12/04'
    page.fill_in 'event_name', with: 'イベント名'
    page.fill_in 'event_description', with: '詳細'

    page.fill_in 'event_stages_attributes_0_place', with: '演奏場所'
    page.fill_in 'event_stages_attributes_0_start_time', with: '2011/12/04 10:11'

    click_button 'ステージを追加'

    page.fill_in 'event_stages_attributes_1_place', with: '演奏場所2'
    page.fill_in 'event_stages_attributes_1_start_time', with: '2011/12/05 10:11'

    click_button '登録する'

    page.should have_content 'イベント名'
    page.should have_content '2011年12月04日(日)'
    page.should have_content '演奏場所'
    page.should have_content '2011年12月04日(日) 10時11分'
    page.should have_content '演奏場所2'
    page.should have_content '2011年12月05日(月) 10時11分'
  end

end

feature 'イベントの更新' do
  let(:account ) { Fabricate :user_account, type: UserAccount::UserType[:admin] }
  include_context 'イベント'

  background 'ログインしてイベント更新画面を表示している' do
    login_as(account)
    visit edit_event_path event
  end

  scenario 'イベントを更新できる', js: true do
    page.fill_in 'event_schedule', with: '2011/12/04'
    page.fill_in 'event_name', with: 'イベント名'
    page.fill_in 'event_description', with: '詳細'

    page.fill_in 'event_stages_attributes_1_place', with: '演奏場所'
    page.fill_in 'event_stages_attributes_1_start_time', with: '2011/12/04 10:11'

    click_button '削除'
    click_button '更新する'

    page.should have_content 'イベント名'
    page.should have_content '2011年12月04日(日)'
    page.should have_content '演奏場所'
    page.should have_content '2011年12月04日(日) 10時11分'
    page.should_not have_content 'ばしょA'
  end
end

feature 'イベントの削除' do
  let(:account ) { Fabricate :user_account, type: UserAccount::UserType[:admin] }
  include_context 'イベント'

  background 'ログインしてイベント詳細画面を表示している' do
    login_as(account)
    visit event_path event
  end

  scenario 'イベントを削除できる' do
    page.should have_content 'いべんと'
    click_link '削除'

    page.should have_content 'イベント一覧'
    page.should_not have_content 'いべんと'
  end
end

feature 'イベントの詳細' do
  let(:account ) { Fabricate :user_account, type: UserAccount::UserType[:admin] }
  include_context '参加登録ありのイベント'

  background 'ログインしてイベント詳細画面を表示している' do
    login_as(account)
    visit event_path event
  end

  scenario 'イベントの詳細が表示されている' do
    page.should have_content 'いべんと'
    page.should have_content 'ばしょA'
  end

  scenario 'イベントの参加者が表示されている' do
    within('.stage_detail') do
      page.should have_content '参加者(1人)'
      page.should have_content account.member.nickname
    end
  end

  scenario 'コメントが書き込める' do
    page.fill_in 'comment_body', with: 'hogehoge'
    click_button '書きこむ'

    within('.comment') do
      page.should have_content 'hogehoge'
      page.should have_content account.member.nickname
    end
  end
end

feature 'イベントの一覧' do
  let(:account ) { Fabricate :user_account, type: UserAccount::UserType[:admin] }
  let(:line1) { 'tbody tr:nth-child(1)' }
  include_context 'イベント'

  background 'ログインしてイベント一覧画面を表示している' do
    login_as(account)
    visit events_path
  end

  it_should_behave_like '参加予定の登録'
end
