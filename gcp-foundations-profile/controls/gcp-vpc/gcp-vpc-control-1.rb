gcp_project_id = attribute("project_id", value:'prj-tf-training')
gcp_vpc_name = attribute("vpc_name", value:'fdn-tst-vpc')

control "default" do                                                                        # A unique ID for this control
  impact 1.0                                                                                # The criticality [0-1], if this control fails.
  title "Google Cloud VPC Network existence check"                                          # A human-readable title
  desc "Ensures the GCP VPC network is getting created and have a description as well."

  describe google_compute_network(project: gcp_project_id, name: gcp_vpc_name) do           # The actual test
    it { should exist }
    its('description') { should_not be_empty }
  end

  describe google_compute_network(project: gcp_project_id, name: gcp_vpc_name) do
    its('auto_create_subnetworks') { should be false }
  end
end

control "creation_time" do
  impact 1.0
  title "Google Cloud VPC Network creation time check"
  desc "Ensures the GCP VPC network is getting created."

  describe google_compute_network(project: gcp_project_id, name: gcp_vpc_name) do
    its('creation_timestamp_date') { should be > Time.now - 365*60*60*24*10 }
  end
end
