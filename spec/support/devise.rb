# coding: utf-8

module AcceptanceTestHelpers
  def password
    '123456'
  end

  def login_as(account)
    visit '/user_account/sign_in'
    logout
    fill_in 'user_account[login_name]', with: account.login_name
    fill_in 'user_account[password]', with: password
    click_button 'ログイン'
  end

  def logout
    if page.has_content? 'ログアウト'
      click_link 'ログアウト'
    end
  end
end
