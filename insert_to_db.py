#!/usr/bin/env python3
from os.path import dirname, join

from pyspark.sql import SparkSession


root = dirname(__file__)
targets = [
    "02_N2_430eV",
    "06_Ar_15atm_258eV",
    "07_Ar_15atm_268eV",
]

builder = (
    SparkSession
    .builder
    .config("spark.jars.packages", "org.mongodb.spark:mongo-spark-connector_2.11:2.3.1")
)

with builder.getOrCreate() as spark:
    for target in targets:
        df = spark.read.parquet(join(root, target, "exported.parquet"))
        (
            df
            .write
            .format("com.mongodb.spark.sql.DefaultSource")
            .option("uri", f"mongodb://mongodb/SP8_2014B.{target}")
            .mode("append")
            .save()
        )
