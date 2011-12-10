# -*- coding: utf-8 -*-
shared_examples_for '参加予定の登録' do
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
