# -*- coding: utf-8 -*-
require 'spec_helper'

feature 'ダッシュボードの表示' do
  let(:account ) { Fabricate :user_account }
  let!(:event) { Fabricate :event, name: 'いべんと', schedule: 2.day.since, stages: [stage_a, stage_b] }
  let(:stage_a) { Fabricate.build :stage, place: 'ばしょA', start_time: 2.day.since }
  let(:stage_b) { Fabricate.build :stage, place: 'ばしょB', start_time: 3.day.since }

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

  scenario '参加予定を登録できる' do
    find(line1).click_link('◯')

    within(line1) do
      page.should have_link('_')
      page.should have_content '◯'
      page.should_not have_link('◯')
      page.should_not have_link('△')
      page.should_not have_link('×')
    end
  end

  scenario '参加予定をキャンセルできる' do
    find(line1).click_link('◯')
    find(line1).click_link('_')

    within(line1) do
      page.should have_link('◯')
      page.should have_link('△')
      page.should have_link('×')
    end
  end

end
