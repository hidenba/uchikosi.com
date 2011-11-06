# -*- coding: utf-8 -*-
require 'spec_helper'
require "cancan/matchers"

describe Ability do
  let(:ability) { Ability.new user }
  let(:member) { user.member }

  describe '管理者権限' do
    let(:user) { Fabricate :user_account, type: UserAccount::UserType[:member] }

    context '自身のMemberは削除できない' do
      it { ability.should_not be_able_to :destroy, member}
    end
  end

  describe '構成担当者権限' do
    let(:user) { Fabricate :user_account, type: UserAccount::UserType[:constitution] }
    let(:other_user) { Fabricate :user_account, type: UserAccount::UserType[:member] }

    context 'Memberの新規・編集・削除できない' do
      it { ability.should_not be_able_to [:create, :update, :destroy], other_user.member}
    end

    context 'Event/Stageの新規・更新・削除ができる' do
      it { ability.should be_able_to [:create, :update, :destroy], Event}
      it { ability.should be_able_to [:create, :update, :destroy], Stage}
    end
  end

  describe 'メンバー権限' do
    let(:user) { Fabricate :user_account, type: UserAccount::UserType[:member] }

    context '自身のMember/UserAccountは更新できる' do
      it { ability.should be_able_to :update, member}
      it { ability.should be_able_to :update, member.user_account}
    end

    context '他のMemberは更新できない' do
      let(:other_user) { Fabricate :user_account, type: UserAccount::UserType[:member] }

      it { ability.should_not be_able_to :update, other_user.member}
    end
  end
end
