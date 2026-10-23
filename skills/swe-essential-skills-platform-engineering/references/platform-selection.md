# Select a platform from workload constraints

## Find the disqualifiers before comparing preferences

Describe one real workload unit: a request with its dependency calls, a job with its inputs and completion deadline, or a client artifact with its download/update path. Record whether it needs persistent local files, long-running work, special hardware, inbound protocols, stable outbound addresses, background CPU, private dependency access, regional placement or a specific runtime. Verify the chosen service's actual support; “container supported” does not mean an arbitrary daemon's lifecycle is supported.

Separate hard constraints from preferences and unknowns. Compare a small number of credible models against the same workload, including the existing platform when appropriate:

| Model | Good reason to consider it | Question that can reject it |
| --- | --- | --- |
| Static hosting with a cache/CDN | Prebuilt assets and independently hosted APIs | Does the application actually need server execution, private asset authorization or a cache invalidation strategy? |
| Managed application/container service | Standard application lifecycle with less host administration | Are runtime, networking, request/job duration, concurrency and scaling semantics compatible? |
| Event/function execution | Bounded event-driven work with explicit completion/retry semantics | Can duplicate delivery, cold starts, payload limits and work after response be handled correctly? |
| VM or owned server | OS-level control, legacy runtimes, persistent agents or special networking | Who owns patching, supervision, access recovery, host loss and capacity replacement? |
| Container orchestration platform | Demonstrated scheduling, isolation or deployment needs across workloads | Does the requirement justify operating/upgrading the control plane, networking and policy—or using a managed equivalent? |

Do not select Kubernetes, multi-region, a service mesh or a particular cloud by default. Conversely, do not force serverless onto a workload whose process, latency or network contract does not fit. Managed services reduce particular operating duties; identify which duties remain, including application patching, identity, data recovery and configuration.

## Size the decision, not just the instance

Estimate idle baseline, representative sustained traffic and plausible peak. Include compute time, minimum instances, storage and growth, requests, database connections, backups, observability, public addresses, load balancers, private connectivity and data transfer where charged. Look up current regional pricing and quota/account eligibility rather than quoting remembered prices. Distinguish a budget alert from an enforced spending limit. Scaling ceilings should protect downstream capacity as well as spend; a maximum worker count is useful only alongside per-worker connection/concurrency bounds.

Map reliability requirements to failure domains. A process supervisor handles a different failure from host replacement; replicated compute does not make a single state store highly available. Establish where state survives and how a replacement workload reconnects. Multi-zone or multi-region placement must account for consistency, traffic steering, recovery and residency rather than merely duplicating application instances. Keep availability and recovery claims tied to the complete dependency chain.

For environments, choose separation according to blast radius and policy: accounts/projects/subscriptions, networks, databases, identities and secret namespaces where needed. A name prefix alone does not prevent a test deployment using production credentials. Identify how developers and CI reach nonpublic environments and how sanitized test data is supplied. Separate human administration, build/deploy authority and runtime identity; creating these identities is not permission to grant them broad access.

## Test the decisive uncertainty

Choose a narrow experiment that can disprove the platform fit: run the artifact under its runtime contract, establish an authorized private database connection, measure a cold start, or verify a job finishes after its caller disconnects using the documented execution model. Prefer local/static checks when they answer the question. Live experiments require an authorized isolated target, resource/cost limits and ownership of cleanup; they are not implicit in a design request.

Leave a decision with the selected model, accepted disadvantages, unresolved evidence and conditions that would change it. Specify a practical exit path: how artifacts, data, DNS, identities and configuration move; do not promise portability solely because the application is containerized.

## Primary-document check example

[Cloud Run's container contract](https://docs.cloud.google.com/run/docs/container-contract) illustrates why a managed container service must be evaluated by its execution model, not its label: service ingress, job completion, filesystem behavior and resource lifecycle have explicit contracts. Read the relevant current sections if using that platform; do not transplant its limits to another host. Provider documentation is evidence for mechanisms, not a recommendation to choose that provider.
