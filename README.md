# Chef InSpec Profiles
This repository contains the Chef's InSpec profiles (Compliance as a Code) for Auditing the resources deployed on Public Cloud Platforms.

## Prerequisites
Below prerequisites must be fulfilled for the successful execution of Chef's InSpec Compliance Profiles to audit your resources.

### Software Requirement
Resources in this repository are meant to use with Chef's InSpec 4.3.2 (check the inspec version using: `inspec version`). If you don't have the compatible version, download it from official Chef repository.

-   [Cloud SDK](https://cloud.google.com/sdk/install) >= 496.0.0
-   [InSpec](https://community.chef.io/downloads/tools/inspec) >= 4.3.2

### Permissions Requirement
**Option-01:** If you are using terraform on your workstation, you can authenticate using User Application Default Credentials ("ADCs").

```
    gcloud auth application-default login
```

**Option-02:** You can create a Service Account and use service account key for authentication.

```
    gcloud auth activate-service-account --key-file project-credentials.json
```

**Note:** 
- Whatever option you choose, make sure the identities have the scopes appropriate for your needs. Access can be fine-grained to follow the principle of least privilege (PoLP).

## Profile Creation and Execution
To execute the InSpec profiles against your resources (in our case, gcp is the target component), go to command prompt and then run the following commands:

- [Required] `inspec init profile --platform gcp my-gcp-profile` # To initialize the profile directory structure and then modify accordingly.
- [Optional] `inspec detect -t gcp://` # To verify the credentials.
- [Required] `inspec exec . -t gcp:// --input-file attributes.yml` # To execute the profiles with the required inputs/attributes.

## References
- https://www.chef.io/downloads
- https://community.chef.io/downloads
- https://community.chef.io/downloads/tools/inspec
- https://docs.chef.io/inspec/
- https://docs.chef.io/inspec/profiles/
- https://docs.chef.io/inspec/cloud/gcp/
- https://github.com/inspec/inspec-gcp
