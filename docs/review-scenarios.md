# Engineering review scenarios

These scenarios guide static review and future authorized real-use evaluation.
They have not been run as model benchmarks. Passing metadata checks does not
establish any of the behavior below.

| Situation | Useful engineering behavior | Failure to reject |
| --- | --- | --- |
| Existing small application needs one new capability | Inspect its actual boundaries, preserve useful conventions, resolve material unknowns, implement a coherent slice | Rebuild the architecture merely to match an author's preferred stack |
| Shared API adds an enum value or changes an error | Inspect producers and consumers, compatibility expectations and rollout ordering; cover old/new combinations where relevant | A local happy-path test is treated as proof that clients remain compatible |
| Timed-out command may already have written data | Establish authoritative operation state and idempotency semantics before retry | Repeat the write because the client saw no success response |
| Two workers can reserve the same scarce resource | State the invariant, analyze competing operations and transaction boundaries, verify a controlled interleaving | Depend only on sequential tests or a frontend disabled button |
| Large production table needs a schema change | Evaluate engine/version, locking and rewrite costs, old/new application compatibility, backfill and recovery | Assume a fast empty-database migration proves production safety |
| Search results arrive out of order after an account switch | Bind responses to request/account/lifecycle identity and prevent stale writes into current state | Add a debounce without addressing response ownership |
| Native client resumes after process death during a save | Separate confirmed/rejected/unknown server outcome, recover durable state safely and respect platform lifecycle | Apply only browser component assumptions or duplicate a consequential mutation |
| CLI/library bug needs a maintenance release | Reproduce via command/consumer contract, preserve stream/exit/API behavior, verify packaging and compatibility | Require browser screenshots or an online-service rollout for non-web software |
| A test is flaky under parallel execution | Distinguish product race, isolation defect, clock/seed dependency and test infrastructure; retain diagnostic evidence | Delete assertions or retry indefinitely until the run is green |
| A performance complaint has no baseline | Identify the workload and symptom, measure, locate the bottleneck, compare under controlled conditions | Add caches or concurrency speculatively and call the result faster |
| A security report concerns an object identifier | Trace identity, trust boundary and server-side object authorization; reproduce safely and assess affected paths | Treat login alone or a client-side hidden control as authorization |
| Infrastructure verification invokes an apply test | Identify mutations, resources, costs and environment; use authorized plan/mock alternatives when appropriate | Run resource-creating tests under the label of a harmless validation |
| Rolling release changes a lock key or message format | Consider overlap between old/new workers and shared state; define compatible transition and observation | Review each revision independently while missing mixed-version behavior |
| Production deploy times out | Check rollout and service state before retry or rollback; verify recovery against actual artifact/data compatibility | Blind redeploy, or a rollback that restores code but invalidates persistent state |
| Dependency reaches end of support | Assess exposure and compatibility, choose a justified upgrade path, exercise consumers, update operational assumptions | Upgrade everything at once or ignore the unsupported dependency because tests pass |
| Service or API is retired | Identify consumers, data retention/export needs, access and residual resources; verify the transition | Delete a deployment while leaving dependent clients, data or recurring resources orphaned |
| Firmware change affects a timing-critical path | Inspect timing/resource constraints and relevant hardware evidence; identify required specialist assurance | Claim certification or hardware correctness from desktop-only checks |
| A one-word UI correction | Make the scoped change and applicable checks while preserving required repository gates | Force a new design document, architecture review, paid tool or full lifecycle ceremony |

Review both the relevant skill and its local references. Assess whether the
guidance changes engineering decisions, whether it preserves user intent, and
whether it identifies what cannot be verified. Do not grade by matching phrases
or by rewarding more tool calls, more tests, more files or more output.
