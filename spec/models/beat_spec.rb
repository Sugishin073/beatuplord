require 'rails_helper'

RSpec.describe Beat, type: :model do
  before do
    @beat = FactoryBot.build(:beat)
  end

  it 'ビートをアップロードしなければ投稿できない' do
    @beat.audio_file = nil
    @beat.valid?
    expect(@beat.errors.full_messages).to include("Audio file can't be blank")
  end

  it 'タイトルがなければ投稿できない' do
    @beat.title = ''
    @beat.valid?
    expect(@beat.errors.full_messages).to include("Title can't be blank")
  end

  it 'is invalid without a valid genre' do
    @beat.genre_id = 1
    @beat.valid?
    expect(@beat.errors.full_messages).to include('Genre must be other than 1')
  end

  it 'is invalid without a valid vibes' do
    @beat.vibes_id = 1
    @beat.valid?
    expect(@beat.errors.full_messages).to include('Vibes must be other than 1')
  end

  it 'ユーザー情報がなければ出品できない' do
    @beat.user = nil
    @beat.valid?
    expect(@beat.errors.full_messages).to include('User must exist')
  end
end
