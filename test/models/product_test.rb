# frozen_string_literal: true

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'correct save' do
    instance = Product.new(title: 'Product', text: 'Какой-то текст', price: 10)
    assert instance.save
  end

  test 'correct get' do
    instance = Product.new(title: 'Product', text: 'Какой-то текст', price: 10.5)
    assert_equal instance.title, 'Product'
  end

  test 'correct destroy' do
    instance = Product.new(title: 'Product', text: 'Какой-то текст', price: 10)
    assert instance.destroy
  end

  test 'error price not num' do
    instance = Product.new(title: 'Product', text: 'Какой-то текст', price: 'aaa')
    instance.validate
    assert_equal instance.errors[:price], ['не является числом']
  end

  test 'error title blank' do
    instance = Product.new(text: 'Какой-то текст', price: 10)
    instance.validate
    assert_equal instance.errors[:title], ['не может быть пустым']
  end

  test 'error price blank' do
    instance = Product.new(title: 'Product', text: 'Какой-то текст')
    instance.validate
    assert_equal instance.errors[:price], ['не является числом', 'не может быть пустым']
  end
end
