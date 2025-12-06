#!/usr/bin/env python
"""Make demo project publicly accessible."""

from geosight.data.models.dashboard import Dashboard
from geosight.data.models.indicator import Indicator
from geosight.data.models.related_table import RelatedTable

try:
    # Make dashboard public
    dashboard = Dashboard.objects.get(slug="demo-geosight-project")
    print(f"Found dashboard: {dashboard.name}")
    print(f"Current dashboard public permission: {dashboard.permission.public_permission}")
    
    dashboard.permission.public_permission = 'Read'
    dashboard.permission.save()
    print(f"✅ Dashboard public permission: {dashboard.permission.public_permission}")
    
    # Set all indicators to Read Data (required for API access)
    indicator_count = 0
    for indicator in Indicator.objects.all():
        indicator.permission.public_permission = 'Read Data'
        indicator.permission.save()
        indicator_count += 1
    print(f"✅ Set {indicator_count} indicators to 'Read Data' permission")
    
    # Set all related tables to Read Data
    related_table_count = 0
    for related_table in RelatedTable.objects.all():
        related_table.permission.public_permission = 'Read Data'
        related_table.permission.save()
        related_table_count += 1
    print(f"✅ Set {related_table_count} related tables to 'Read Data' permission")
    
    print("✅ Demo project is now fully publicly accessible!")
except Exception as e:
    print(f"❌ Error: {e}")
    import sys
    sys.exit(1)
