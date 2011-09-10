# -*- coding: utf-8 -*-
class Staff
  include Mongoid::Document
  class Presence < ActiveEnum::Base
    value id: 1, name: 'participation'
    value id: 2, name: 'non_participation'
    value id: 3, name: 'suspense'
  end

  belongs_to :event
  belongs_to :member

  field :presence, type: Integer

  scope :registered, ->(member){ where(:member == member) }
  scope :participations, where(presence: Staff::Presence[:participation])
  scope :non_participations, where(presence: Staff::Presence[:non_participation])
  scope :suspense, where(presence: Staff::Presence[:suspense])
end
