---
# DAY 1

## WHAT IS CLOUD COMPUTING
Cloud Computing is the on demand of computing services such as databases, storages, networking with pay-as-you-go pricing. 

---

## CLOUD SERVICE MODELS
### IaaS (Infrastructure as a Service)
**IaaS** is a Cloud Service Model where a third-party provider delivers fundamental computing servers, storage, networking etc. You will only configure it to your needs and only pay for what you used. Maintenance and scaling is handled by the provider. E.g AWS(EC2, EFS, EBS, S3, VPC)

***Real Life Analogy:*** *Renting an empty building, the landlord owns the physical structure, the roof, the plumbing, and the electriciity. You rent the empty space, bring in your funiture, set up your office layout, install your security doors, and run your business operations. You have total control over what you do inside the building, but you also responsible for arranging, cleaning and securing everything you put inside it.*

**How IaaS Works**
- **Virtualization:** Providers use hypervisors to split physical servers into independent virtual machines (VMs).
- **On-Demand Access:** Users control resources through a dashboard or API without maintaining physical hardware.
- **Pay-As-You-Go:** Organizations pay only for the compute time and storage space they consume.

**PROS**
- **Cost Efficiency:** Eliminates the massive upfront capital expenses (CapEx) of purchasing hardware, converting IT spending into a predictable, operational expenses (OpEx).
- **Rapid Scalability:** Allows business to scale compute power and storage up or down instantly to meet fluctuating demand.
- **High availability:** Features built-in redundancy, automated backups, and disaster revovery across global data centers to minimize downtime.
- **Reduced maintenance:** Shifts the burden of physical hardware maintenance, cooling, and facility security to the vendor.

**CONS**
- **Security complexities:** While the provider secures the hardware, the user is entirely responsible for securing their own operating systems, data, and applications.
- **Hidden costs:** Expenses can spiral if cloud usage, data transfer fees, and idle storage resources are not closely monitored.
- **Vendor lock-in:** Migrating massive workloads or specialized configurations from one IaaS provider to another can be technically complex and expensive.
- **Limited control:** Users have no control over the underlying physical hardware, virtualization layer, or sudden vendor maintenance schedules.

### PaaS (Platform as a Service)
**PaaS** is a Cloud Service Model that let you build and run apps with managing underlying hardware or operating systems.

***Real Life Analogy:*** *Renting a fully furnished building, office layout, security doors, electricity, everything you needed to run your business is already installed, you just have to bring in your business branding materials and workers.*

**How PaaS Works**
PaaS acts as a layer siting on top of basis cloud infrastructure.
**Infrastructure abstraction:** The cloud provider manages servers, storage, networking, and physical data centers.

**Middleware and runtimes:** The provide supplies operating systems, databases, and execution runtimes for various programming languages.

**Developer workflow:** Developers write code, upload or connect it through tools like GitHub, and the platform automatically configures the environment to deploy and run the application.

**Automated scaling:** The platform scales resources up or down automatically based on user traffic and demand.

**PROS**
- **Speed and agility:** Speeds up development and deployment times, allowing faster time-to-market.
- **Lower costs:** Eliminated the upfront cost of building physical IT infrastructure.
- **No infrastructure management:** Frees developers from server maintenance, patching, and system administration.
- **Built-in scalability:** Automatically adjusts computing resources during traffic spikes.
- **Easy collaboration:** Enables remote or distributed development teams to work on the same project over the internet.

**CONS**
- **Vendor lock-in:** Makes it hard and expensive to switch to another provider because your app relies on specific platform tools and architecture.
- **Less control:** Limits deep customization of the underlying hardware or operating system.
- **Integration challenges:** Can make connecting with older, on-premise legacy systems difficult.
- **Higher costs at scale:** Can become more expensive than basic Infrastructure-as-a-Service (IaaS) when handling massive, steady volumes of traffic.
  
### SaaS (Software as a Service)
**Saas** is a cloud computing model where a third-party provider hosts applications and delivers them to users over the internet, typically through a web browser on a subscription basis. In other words, SaaS is a finish product/service ready to be serve or consume. e.g Gmail, AWS Cloud, LinkedIn, GitHub etc.

***Real Life Analogy:*** *Here, everything is already in place, the building well furnished, business branding materials already installed and workers working, you just consume the products or services.

**How SaaS Works**
- **Cloud hosting:** The software runs on remote servers managed by the provider, not on your local computer or officer server.
- **Internet access:** Users log in through a web browser of lightweight client using an internet connection.
- **Subscription pricing:** Instead of buying a permanent license upfront, users pay regular fees (monthly or annually).
- **Automatic updates:** The provider handles maintenance, patches, security, and feature updates automatically for everyone.

**PROS:** 
- **Low upfront costs:** Subscriptions replace expensive, one-time license fees and reduce the need for physical IT hardware.
- **Quick deployment:** Applications are pre-configured in the cloud and ready to use immediately.
- **Accessibility:** Users can log in from any device with an internet connection, supporting remote work.
- **Automatic updates:** The provider manages all software patches, updates, and maintenance.
- **Scalability:** Businesses can easily upgrade or downgrade user counts and resources as needed.

**CONS**
- **Internet dependency:** Systems require a steady, stable internet connection to function.
- **Less control:** Users depend on the provider for updates and cannot always defer changes or customize core features.
- **Security & privacy:** Storing sensitive data off-site creates exposure to potential data breaches or privacy regulations.
- **Recurring costs:** Long-term subscription fees can accumulate and end up costing more over time than a one-time purchase.
- **Vendor lock-in:** Switching to a different software provider or moving data off a proprietary platform can be difficult.

### FaaS (Funtion as a Service)
**FaaS** or serverless computing, is a cloud service model where developers write individual pieces of code or functions that ring in response to specific events, without needing to manage any underlying server infrastructure. E.g. AWS Lambda, GCP Functions, and Microsoft Azure Functions.

**How FaaS Works**
- **Event-Driven Execution:** Code remains dormant and consumes zero computing resources until an external trigger activates it. Triggers can be HTTP requests, file uploads, database updates, or scheduled timers.
- **Automatic Provisioning:** When an event happens, the cloud provider instantly spins up a container to execute that specific function code.**
- **Ephemeral Life-cycle:** Once the function finishes its task, the container shuts down or goes back to sleep immediately.
- **Consumption Pricing:** You are billed strictly by the number of requests and the exact milliseconds your code takes to run, rather than paying for idle server time.

**PROS**
- **No Server Management:** Providers handle all hardware maintenance, operating system patches, and security configurations, freeing up developers to focus entirely on code logic.
- **Automatic Scaling:** The **FaaS** platform scales capacity up instantly during traffic spikes and scales down to zero when demand drops.
- **Cost Efficiency:** Because you pay only for active execution time, spiky or unpredictable workloads can be significantly cheaper than maintaining always-on virtual severs.
- **Faster Deployment:** Breaking applications into small modular functions allows teams to build, test, and push updates interactively.

**CONS**
- **Cold Starts:** When a function hasn't been used recently, the provider must boot up a new container, which can introduce a noticeable latency delay on the first request.
- **Vendor Lock-In:** Migrating your functions from one cloud provider to another can be difficult because each platform uses proprietary triggers, APIs, and configurations.
- **Harder Debugging and Monitoring:** Distributed, short-lived containers make tracking errors and logging requests across multiple chained functions more complex than inspecting a traditional server.
- **Stateless Limitations:** Functions cannot reliably store local data between runs, meaning you must configure external databases or caches for session and state management.

---

## WHY AWS?
**Amazon Web Services (AWS)** is chosen by millions of business because it provides secure, scalable, and cost-effective cloud computing without the need to buy physical hardware.

**Key Benefits of AWS**
- **Pay-As-You-Go Pricing:** You only pay for the exact computing resources you use, avoiding big upfront costs or long-term contracts.
- **Scalability:** You can instantly grow or shrink your server capacity in minutes based on user traffic.
- **Global Reach:** AWS runs the largest global infrastructure with data centers worldwide, ensuring fast speeds and high reliability.
- **Security:** AWS offers advanced tools and isolated networks designed to protect sensitive government and financial data.
- **Broad Service Selection:** AWS provides over 200 fully featured services, from basic virtual servers to artificial intelligence and machine learning.


## AWS REGION AND AVAILABILITY ZONES
**AWS Regions** are separate geographic areas that house Amazon Web Services data centers.

**Key Concepts**
- **Region:** A physical location in the world with multiple availability zones. Regions are completely independent and isolated from each other to guarantee fault tolerance.
- **Availability Zone (AZ):** One or more discrete data centers inside a region. Each has independent power, cooling, and networking. They connect using high-speed, low-latency links.
- **Edge Location:** A site used to cache content and lower latency for end users.

**Why Regions Matter**
- **Performance:** Pick a region close to your users to reduce network delay.
- **Compliance:** Keep data inside specific geographic borders to meet local privacy laws.
- **Availability:** Copy your data across multiple availability zones or regions to survive or power failures.
**AWS Availability Zone (AZ)** is one or more discrete data centers with redundant power, networking, and connectivity located inside an **AWS Region**

**Key Features**
- **Isolation:** AZs are physically separated by a meaningful distance (Many kilometers, up to 60 miles or 100 km) to prevent a single local disaster or outage from affecting multiple zones.
- **Redundancy:** Each AZ has independent power sources, cooling equipment, and backup generators supplied by separate local substations.
- **Connectivity:** AZs within the same region connect via high-bandwidth, low-latency networking over dedicated, fully encrypted fiber-optic links.
- **Naming:** Each AZ is identified by a region code followed by a letter e.g. us-east-1a, us-east-1b and us-east-1c.

**Why Use Availability Zones**
- **High Availability:** Distributing apps and databases across multiple AZs protects your workload against physical failures.
- **Fault Tolerance:** If one AZ experiences an issue, traffic can instantly shift to a healthy instance running in a seperate AZ.
- **Synchronous Replication:** Low latency between zones (single-digit miliseconds) allows for real-time, synchronous data replication.

**The AWS GLOBAL INFRASTRUCTURE spans 39 geographic regions and 124 availability zones worldwide.**

## WHERE DO AWS SERVICES LIVE?
**Global:** Not tied to any region e.g. IAM, Route 53, Cloudfront, WAF.
**Regional:** Operate within a region e.g. VPC, S3, EFS, DynamoDB, Lambda, SNS.
**AZ-Specific:** Run in specific AZs e.g. EC2, RDS, EBS, Subnet, NAT Gateway.
**Multi-Region:** Cross-region replication e.g. DynamoDB Global, S3 CRR, Aurora Global.

## WHAT IS VPC & WHY DOES IT MATTER?
**VPC (Virtual Private Cloud)** is an isolated private network inside AWS. Is like having a secure building in a massive cloud city. Without VPC, your resources would be exposed to everyone

**VPC features**
- **Isolation:** Your resources are logically isolated from other AWS customers.
- **Full Control:** Define your own IP ranges, subnets, and routing rules.
- **Security:** Control traffic with Security Groups and Network ACLs.
- **Foundation:** Almost every AWS resource you launch lives inside a VPC.

**VPC Explained Simply**
Think of a VPC as your own **private gated community** in the cloud. You control:
Who can enter - who can go out - How traffic flows

**With VPC**
- Resources in private isolated network
- Only you control who gets in
- Custom IP ranges, subnets & routing
- Defense in depth with layers

**Without VPC**
- Resources exposed to public internet
- Anyone can see and access your servers
- No network boundaries of rules
- Security depends on each resource

---
