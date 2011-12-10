# -*- coding: utf-8 -*-
require 'spec_helper'
require 'acceptance/shared_context/events'
require 'acceptance/shared_example/events'

feature 'ダッシュボードの表示' do
  let(:account ) { Fabricate :user_account }
  include_context 'イベント'

  let(:line1) { 'tbody tr:nth-child(1)' }
  let(:line2) { 'tbody tr:nth-child(2)' }

  background 'ログインしてダッシュボードを表示している' do
    login_as(account)
    visit '/dashboard'
  end

  scenario '終了していないイベントの一覧が表示される' do
    within(line1) do
      page.should have_content event.name
      page.should have_content stage_a.place
      page.should have_link('◯')
      page.should have_link('△')
      page.should have_link('×')
    end

    within(line2) do
      page.should_not have_content event.name
      page.should have_content stage_b.place
      page.should have_link('◯')
      page.should have_link('△')
      page.should have_link('×')
    end
  end

  it_should_behave_like '参加予定の登録'
end
