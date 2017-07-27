Rails.application.routes.draw do
  root to: 'groups#index'
  resouces: :groups, only: :index do
    resouces: :messages, only: :index
  end
end
