class Api::V1::ItemsController < ApplicationController

  test '#index' do
    get :index, format: :JSON

    assert_response :success
  end
end
