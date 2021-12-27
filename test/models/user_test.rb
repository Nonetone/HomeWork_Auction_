# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'correct save' do
    instance = User.new(username: 'Nonetone None', password: '12345678')
    assert instance.save
  end

  test 'correct get' do
    instance = User.new(username: 'Nonetone None', password: '12345678')
    assert_equal instance.username, 'Nonetone None'
  end

  test 'correct destroy' do
    instance = User.new(username: 'Nonetone None', password: '12345678')
    assert instance.destroy
  end

  test 'error not uniq email' do
    f_instance = User.new(username: 'ABR', password: '12345678')
    f_instance.save
    s_instance = User.new(username: 'ABR', password: '12345678')
    s_instance.validate
    assert_equal s_instance.errors[:username], ['уже существует']
  end

  test 'error short password' do
    instance = User.new(username: 'Nonetone None', password: '1')
    instance.validate
    assert_equal instance.errors[:password], ['недостаточной длины (не может быть меньше 3 символов)']
  end

  test 'error name blank' do
    instance = User.new(password: '12345678')
    instance.validate
    assert_equal instance.errors[:username], ['не может быть пустым']
  end

  test 'error password blank' do
    instance = User.new(username: 'Nonetone None')
    instance.validate
    assert_equal instance.errors[:password], ['не может быть пустым', 'недостаточной длины (не может быть меньше 3 символов)']
  end
end
