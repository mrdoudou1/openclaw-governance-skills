# permflow risk levels

## Low risk
- read-only checks
- internal analysis
- non-destructive organization

## Medium risk
- configuration edits
- service restarts with known impact
- scheduled task creation

## High risk
- destructive file operations
- public exposure changes
- remote host mutation
- external messaging

## Approval framing
Always say:
- what will change
- possible impact
- rollback path
- exact command or file target when relevant
