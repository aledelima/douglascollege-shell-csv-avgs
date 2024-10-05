#!/bin/bash

# CSV File name
csv_file="world_cup_indicators.csv"

# Process data using awk
awk -F, 'NR>1 {
    region = $2
    total_victories[region] += $3
    total_defeats[region] += $4
    total_goals[region] += $5
    count[region]++
}
END {
    # Print table header
    printf "%-20s | %-20s | %-20s | %-20s\n", "Region", "Avg Victories", "Avg Defeats", "Avg Goals Scored"
    printf "%-20s | %-20s | %-20s | %-20s\n", "--------------------", "--------------------", "--------------------", "--------------------"

    # Print table rows for each region
    for (region in total_victories) {
        printf "%-20s | %-20.2f | %-20.2f | %-20.2f\n", region, total_victories[region] / count[region], total_defeats[region] / count[region], total_goals[region] / count[region]
    }
}' "$csv_file"