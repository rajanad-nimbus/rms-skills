# RMS Seasons & Work Orders - Operations, Batch Jobs & RIB Integration Guide

### **Phases of the Batch Cycle & Dependencies**

The RMS batch cycle is divided into a number of processing phases.  Phase design is an
important part of overall RMS batch design. Respecting the phases is critically important
to ensuring data integrity throughout the batch cycle.

Each phase has a high level theme, but also generally contains some programs with a
different major purpose. All programs in one processing phase should complete before
any programs in the next phase begin.

Programs are assigned to specific phases. Each program should run in its designated
processing phase of the batch cycle. Both within and across phases, individual programs
also have dependencies. These dependencies ensure that data is in the correct state for
processing.

**2** Oracle Retail Merchandising System

Phases of the Batch Cycle & Dependencies

The following diagram gives a high level overview of the processing phases of the RMS
batch cycle:

^Note - Ad hoc processes are not
strictly constrained to one phase
of the batch cycle.

Ad hoc jobs may be run multiple
times per day in parallel with other
operations.

Ad hoc jobs can have
dependencies on specific jobs in
phases. In these cases, it is
presumed that if a transaction
misses the current run of the ad
hoc job, it will be picked up by the

next run.

Phase 0**

Admin

Phase 1**

RMS Internal
Processing

Phase 2**

RMS Prep &
& Integration – Uploads

Phase 3**

RMS Main
Processing

Phase 4**

RMS Integration –
Downloads****

Phase 5**

ReIM Integration –
Uploads

Phase 6**

ReIM Main
Processing

Phase 7**

ReIM Integration –
Downloads
