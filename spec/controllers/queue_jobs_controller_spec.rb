require 'rails_helper'

RSpec.describe QueueJobsController do
  login_user

  describe "Post 'create'" do
    let(:queue_job_params) { attributes_for(:queue_job) }
    
    it "assign job" do
      params = { queue_jobs: queue_job_params.merge(title: ["title"]) }
      post :create , params: params
      expect(response.status).to eq(200)
    end

    it "should not create if params are not valid" do
      params = { queue_jobs: queue_job_params }
      post :create , params: params
      expect(response.status).to eq(422)
    end
  end
end