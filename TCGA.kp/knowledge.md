---
title: TCGA Cohort Mutation Counts
path: TCGA
authors:
- kellrott
tags:
- tcga
- mutations
- mc3
created_at: 2018-05-09 00:00:00
updated_at: 2018-05-09 11:25:12.089860
tldr: Find the number of mutations per gene for TCGA cohort
---
```python
import pandas
import aql
conn = aql.Connection("http://arachne.compbio.ohsu.edu")
O = conn.graph("bmeg")
```

```python
q = O.query().V().where(aql.eq("$.label", "Individual"))
q = q.where(aql.and_(aql.eq("source", "tcga"), aql.eq("disease_code", "KIRC")))
q = q.in_("sampleOf").in_("callSetOf").where(aql.eq("method", "MUTECT"))
q = q.in_("variantCall").out("variantIn")
q = q.aggregate(aql.term("agg", "Gene", "symbol"))

res = list(q)
for i in res[0]['data']['buckets']:
    print i['key'], i['value']

```
    TP53 2
    VHL 2
    ACSM1 1
    AHNAK2 1
    APBA2 1
    B3GAT1 1
    B4GALNT4 1
    BRINP3 1
    BTBD2 1
    C2CD2L 1
    C8orf34 1
    CEP76 1
    CNTN1 1
    COL5A3 1
    CRAT 1
    EFCAB12 1
    EPHA8 1
    F13B 1
    FLRT2 1
    GJA10 1
    GPHN 1
    GRAMD1A 1
    H2AFY2 1
    HRASLS 1
    HUNK 1
    IQSEC3 1
    IRX6 1
    ITGA10 1
    ITPR3 1
    KAT8 1
    KMT2C 1
    KRTAP4-9 1
    KRTAP5-1 1
    LAMA2 1
    LRRTM4 1
    MICALCL 1
    MTMR10 1
    NCKAP5 1
    NDST4 1
    NDUFB6 1
    NEBL 1
    NFE2L2 1
    NLRP4 1
    OR52J3 1
    OR6N1 1
    OTOA 1
    PBRM1 1
    PCDH19 1
    PCDHA6 1
    PCDHGA3 1
    PDE4C 1
    PENK 1
    PI16 1
    PLCL1 1
    POM121L12 1
    PRF1 1
    PSKH2 1
    RB1 1
    RPS6KA1 1
    SIPA1L3 1
    SLC26A11 1
    TM4SF20 1
    TTN 1
    ZNF831 1
