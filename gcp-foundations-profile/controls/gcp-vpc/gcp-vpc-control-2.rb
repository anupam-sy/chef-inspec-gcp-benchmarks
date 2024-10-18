gcp_project_id = attribute("project_id", value:'prj-tf-training')
gcp_vpc_name = attribute("vpc_name", value:'fdn-tst-vpc')

control "routing_mode" do
  impact 0.75
  title "Google network routing mode check"
  desc "Ensures the GCP VPC network is configured with GLOBAL routing mode."

  describe google_compute_network(project: gcp_project_id, name: gcp_vpc_name) do
    it { should exist }
    its('routing_config.routing_mode') { should eq 'GLOBAL' }
  end
end
