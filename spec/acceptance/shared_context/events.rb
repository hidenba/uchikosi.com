# -*- coding: utf-8 -*-
shared_context 'イベント' do
  let!(:event) { Fabricate :event, name: 'いべんと', schedule: 2.day.since, stages: [stage_a, stage_b] }
  let(:stage_a) { Fabricate.build :stage, place: 'ばしょA', start_time: 2.day.since }
  let(:stage_b) { Fabricate.build :stage, place: 'ばしょB', start_time: 3.day.since }
end

shared_context '参加登録ありのイベント' do
  include_context 'イベント'
  let!(:staff) { Fabricate :staff, member: account.member, stage: stage_a, presence: 1 }
end
