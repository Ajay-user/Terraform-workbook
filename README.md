# Terraform-workbook

### Terraform-101

### What is terraform ?
Terraform is an open-source infrastructure as code software tool that enables you to safely and predictably create, change, and improve infrastructure.

### What is it used for ?
Terraform is an IAC tool, used primarily by DevOps teams to automate various infrastructure tasks. The provisioning of cloud resources, for instance, is one of the main use cases of Terraform.

Terraform allows you to describe your complete infrastructure in the form of code. Even if your servers come from different providers such as AWS or Azure, Terraform helps you build and manage these resources in parallel across providers.

Terraform uses a plugin-based architecture to support the numerous infrastructure and service providers available. Each "Provider" is its own encapsulated binary distributed separately from Terraform itself. 


## Benefits of Infrastructure-as-Code (IaC)


IaC replaces standard operating procedures and manual effort required for IT resource management with lines of code. Instead of manually configuring cloud nodes or physical hardware, IaC automates the process infrastructure management through source code.


Here are several of the major key benefits of using an IaC solution like Terraform:

* `Speed and Simplicity`
* `Error Reduction` 
* `Disaster Recovery`
* `Enhanced Security`


### Terraform Workflow
The Terraform workflow consists of the following three steps:

* Step 1: `Write`  <br>
Declare your infrastructure resources as code using the Hashicorp Configuration Language (HCL).

* Step 2: `Review` <br>
Use terrafrom plan to review the review the infrastructure

* Step 3: `Apply` <br>
Finally, you can accept planned changes to add or remove any infrastructure resources by applying the configuration
