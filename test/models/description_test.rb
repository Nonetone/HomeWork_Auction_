# frozen_string_literal: true

require 'test_helper'

class DescriptionTest < ActiveSupport::TestCase
  test 'correct save' do
    instance = Description.new(text: 'Какой-то текст', price: 10, raise_by: 2.2, product: 1)
    assert instance.save
  end

  test 'correct get' do
    instance = Description.new(text: 'Какой-то текст', price: 10, raise_by: 2.2, product: 1)
    assert_equal instance.text, 'Какой-то текст'
  end

  test 'correct destroy' do
    instance = Description.new(text: 'Какой-то текст', price: 10, raise_by: 2.2, product: 1)
    assert instance.destroy
  end

  test 'error price not num' do
    instance = Description.new(text: 'Какой-то текст', price: 'gf', raise_by: 2.2, product: 1)
    instance.validate
    assert_equal instance.errors[:price], ['не является числом']
  end

  test 'error raise_by not num' do
    instance = Description.new(text: 'Какой-то текст', price: 10, raise_by: 'as', product: 1)
    instance.validate
    assert_equal instance.errors[:raise_by], ['не является числом']
  end

  test 'error price blank' do
    instance = Description.new(text: 'Какой-то текст', raise_by: 2, product: 1)
    instance.validate
    assert_equal instance.errors[:price], ['не является числом', 'не может быть пустым']
  end

  test 'error raise_by blank' do
    instance = Description.new(text: 'Какой-то текст', price: 2, product: 1)
    instance.validate
    assert_equal instance.errors[:raise_by], ['не является числом', 'не может быть пустым']
  end
end
