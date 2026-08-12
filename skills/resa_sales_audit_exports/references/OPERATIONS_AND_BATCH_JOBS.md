# ReSA Sales Audit Exports - Operations & Batch Jobs

## Nightly C/Pro*C Batch Programs

1. **`saexprms`**: Multi-threaded C program that reads audited transactions and writes stock ledger rows to RMS `TRAN_DATA_HISTORY`.
2. **`saexpgl`**: Reads store day totals, applies `SA_FIF_GL_CROSS_REF`, and generates flat file or database table records for General Ledger.
3. **`saexpach`**: Generates automated clearing house deposit settlement files for commercial banks.
4. **`saexpsim`**: Transmits real-time store inventory return receipts to SIM.
5. **`saexppos`**: Transmits cashier over/short discrepancies back to store POS.
