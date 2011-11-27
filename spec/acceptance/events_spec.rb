# -*- coding: utf-8 -*-
require 'spec_helper'

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
  let(:event) { Fabricate :event, name: 'いべんと', schedule: 2.day.since, stages: [stage_a, stage_b] }
  let(:stage_a) { Fabricate.build :stage, place: 'ばしょA', start_time: 2.day.since }
  let(:stage_b) { Fabricate.build :stage, place: 'ばしょB', start_time: 3.day.since }

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
