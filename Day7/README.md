for_each is used to create multiple resources dynamically using:
✅ map - when you need key + value pair
When to Use Map?
When each resource needs:
Different values,
Different configurations,
Named resources.
-----------------------------------------------------------------
✅ set (toset()) - when you only need unique values
Why use toset()?
Because:
List can contain duplicates,
Set automatically removes duplicates,
for_each requires unique keys.
----------------------------------------------------------------
