# frozen_string_literal: true

require 'test_helper'

class CreateProductTest < ActionDispatch::IntegrationTest
  def setup
    post users_path, params: { user: { username: 'None', password: '12345678', password_confirmation: '12345678' } }
    post session_path, params: { username: 'None', password: '12345678' }
    post '/product', params: { product: { title: 'Предмет 1', text: 'Текст этого предмета', price: '100' } }
    @id = Product.find_by(title: 'Предмет 1').id
  end

  test 'correct profile to' do
    get profile_path
    assert_response :success
  end
  
  test 'correct add price' do
    get add_path
    assert_equal User.find_by(username: 'None').price, 1000
  end

  test 'correct my_goods to' do
    get my_goods_path
    assert_response :success
  end
end
