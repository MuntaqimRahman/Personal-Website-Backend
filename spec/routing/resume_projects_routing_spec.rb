require "rails_helper"

RSpec.describe ResumeProjectsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/resume_projects").to route_to("resume_projects#index")
    end

    it "routes to #show" do
      expect(get: "/resume_projects/1").to route_to("resume_projects#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/resume_projects").to route_to("resume_projects#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/resume_projects/1").to route_to("resume_projects#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/resume_projects/1").to route_to("resume_projects#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/resume_projects/1").to route_to("resume_projects#destroy", id: "1")
    end
  end
end
