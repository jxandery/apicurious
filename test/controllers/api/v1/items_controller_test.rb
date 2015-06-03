require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test '#index' do
    get :index, format: :json

    items = JSON.parse(response.body)
    first_item = items.first

    assert_response :success
    assert_equal 'Lanister', first_item['name']
    assert_equal 'rich but inbred', first_item['description']
    assert_equal 2, items.count
  end

  test '#show' do
    item = Item.first
    get :show, format: :json, id: item.id

    item = JSON.parse(response.body)
    assert_response :success
    assert_equal 'Lanister',        item['name']
    assert_equal 'rich but inbred', item['description']
  end

  test '#create' do
    item_params = {name: 'Targaryen', description: 'dj hair'}
    post :create, format: :json, item: item_params

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal 'Targaryen', item['name']
    assert_equal 'dj hair', item['description']
  end

  test '#update' do
    original_item = Item.first

    item_params = {name: 'Targaryen', description: 'dj hair'}
    put :update, format: :json, id: original_item.id, item: item_params

    assert_response :success
  end
end
