CREATE TABLE supplier (
        s_suppkey  BIGINT NOT NULL,
        s_name CHAR(25) NOT NULL,
        s_address VARCHAR(40) NOT NULL,
        s_nationkey BIGINT NOT NULL,
        s_phone CHAR(15) NOT NULL,
        s_acctbal FIXEDDECIMAL NOT NULL,
        s_comment VARCHAR(101) NOT NULL) TABLESPACE ts_disk1 DISTRIBUTE BY REPLICATION;

CREATE TABLE part (
        p_partkey BIGINT NOT NULL,
        p_name VARCHAR(55) NOT NULL,
        p_mfgr CHAR(25) NOT NULL,
        p_brand CHAR(10) NOT NULL,
        p_type VARCHAR(25) NOT NULL,
        p_size INTEGER NOT NULL,
        p_container CHAR(10) NOT NULL,
        p_retailprice FIXEDDECIMAL NOT NULL,
        p_comment VARCHAR(23) NOT NULL) TABLESPACE ts_disk1 DISTRIBUTE BY HASH (p_partkey);

CREATE TABLE partsupp (
        ps_partkey BIGINT NOT NULL,
        ps_suppkey BIGINT NOT NULL,
        ps_availqty INTEGER NOT NULL,
        ps_supplycost FIXEDDECIMAL NOT NULL,
        ps_comment VARCHAR(199) NOT NULL) DISTRIBUTE BY HASH (ps_partkey);

CREATE TABLE customer (
        c_custkey BIGINT NOT NULL,
        c_name VARCHAR(25) NOT NULL,
        c_address VARCHAR(40) NOT NULL,
        c_nationkey BIGINT NOT NULL,
        c_phone CHAR(15) NOT NULL,
        c_acctbal FIXEDDECIMAL NOT NULL,
        c_mktsegment CHAR(10) NOT NULL,
        c_comment VARCHAR(117) NOT NULL) TABLESPACE ts_disk2 DISTRIBUTE BY REPLICATION;

CREATE TABLE orders (
        o_orderkey BIGINT NOT NULL,
        o_custkey BIGINT NOT NULL,
        o_orderstatus CHAR(1) NOT NULL,
        o_totalprice FIXEDDECIMAL NOT NULL,
        o_orderdate DATE NOT NULL,
        o_orderpriority CHAR(15) NOT NULL,
        o_clerk CHAR(15) NOT NULL,
        o_shippriority INTEGER NOT NULL,
        o_comment VARCHAR(79) NOT NULL) DISTRIBUTE BY HASH (o_orderkey);

CREATE TABLE lineitem (
        l_orderkey BIGINT NOT NULL,
        l_partkey BIGINT NOT NULL,
        l_suppkey BIGINT NOT NULL,
        l_linenumber BIGINT NOT NULL,
        l_quantity FIXEDDECIMAL NOT NULL,
        l_extendedprice FIXEDDECIMAL NOT NULL,
        l_discount FIXEDDECIMAL NOT NULL,
        l_tax FIXEDDECIMAL NOT NULL,
        l_returnflag CHAR(1) NOT NULL,
        l_linestatus CHAR(1) NOT NULL,
        l_shipdate DATE NOT NULL,
        l_commitdate DATE NOT NULL,
        l_receiptdate DATE NOT NULL,
        l_shipinstruct CHAR(25) NOT NULL,
        l_shipmode CHAR(10) NOT NULL,
        l_comment VARCHAR(44) NOT NULL) TABLESPACE ts_disk1 DISTRIBUTE BY HASH (l_orderkey);

CREATE TABLE nation (
        n_nationkey BIGINT NOT NULL,
        n_name CHAR(25) NOT NULL,
        n_regionkey BIGINT NOT NULL,
        n_comment VARCHAR(152) NOT NULL) DISTRIBUTE BY REPLICATION;

CREATE TABLE region (
        r_regionkey BIGINT NOT NULL,
        r_name CHAR(25) NOT NULL,
        r_comment VARCHAR(152) NOT NULL) DISTRIBUTE BY REPLICATION;

