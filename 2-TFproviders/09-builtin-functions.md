# Built-in Functions in Terraform

## Overview

Terraform provides a variety of built-in functions that can be used to manipulate data within your configuration.

## Common Functions

### `length()`

Returns the length of a string or list.

```hcl
variable "my_list" {
  default = ["a", "b", "c"]
}

output "list_length" {
  value = length(var.my_list)
}
```

### `join()`

Joins a list of strings into a single string.

```hcl
output "joined_string" {
  value = join(", ", var.my_list)
}
```

### `lookup()`

Looks up a value in a map.

```hcl
variable "my_map" {
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

output "lookup_value" {
  value = lookup(var.my_map, "key1")
}
```

## Conclusion

Built-in functions provide powerful tools for data manipulation and enhance the expressiveness of Terraform configurations.


[Previous: Conditional Expression](08-conditional-expressions.md) | [Back to README](README.md)
