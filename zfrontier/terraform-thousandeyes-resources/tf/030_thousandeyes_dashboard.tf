# 030 · resource thousandeyes_dashboard · 6. Dashboards
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_dashboard.example id = "resource_id" } ```
# Reads models/thousandeyes_dashboard.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_030 = yamldecode(file("${path.module}/../models/thousandeyes_dashboard.yml"))["thousandeyes_dashboard"]
}

resource "thousandeyes_dashboard" "n030" {
  description        = local.m_030["description"]
  global_filter_id   = local.m_030["global_filter_id"]
  is_global_override = local.m_030["is_global_override"]
  is_private         = local.m_030["is_private"]
  title              = local.m_030["title"]
  dynamic "default_timespan" {
    iterator = default_timespan_1
    for_each = local.m_030["default_timespan"] == null ? [] : range(length(local.m_030["default_timespan"]))
    content {
      duration = lookup(local.m_030["default_timespan"][default_timespan_1.value], "duration", null)
      end      = lookup(local.m_030["default_timespan"][default_timespan_1.value], "end", null)
      start    = lookup(local.m_030["default_timespan"][default_timespan_1.value], "start", null)
    }
  }
  dynamic "widgets" {
    iterator = widgets_1
    for_each = local.m_030["widgets"] == null ? [] : range(length(local.m_030["widgets"]))
    content {
      data_source                              = lookup(local.m_030["widgets"][widgets_1.value], "data_source", null)
      metric                                   = lookup(local.m_030["widgets"][widgets_1.value], "metric", null)
      metric_group                             = lookup(local.m_030["widgets"][widgets_1.value], "metric_group", null)
      should_exclude_alert_suppression_windows = lookup(local.m_030["widgets"][widgets_1.value], "should_exclude_alert_suppression_windows", null)
      title                                    = lookup(local.m_030["widgets"][widgets_1.value], "title", null)
      type                                     = lookup(local.m_030["widgets"][widgets_1.value], "type", null)
      visual_mode                              = lookup(local.m_030["widgets"][widgets_1.value], "visual_mode", null)
      dynamic "agent_status_config" {
        iterator = agent_status_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "agent_status_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["agent_status_config"]))
        content {
          agent_type = lookup(local.m_030["widgets"][widgets_1.value]["agent_status_config"][agent_status_config_2.value], "agent_type", null)
          show       = lookup(local.m_030["widgets"][widgets_1.value]["agent_status_config"][agent_status_config_2.value], "show", null)
        }
      }
      dynamic "alert_list_config" {
        iterator = alert_list_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "alert_list_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["alert_list_config"]))
        content {
          active_within_unit  = lookup(local.m_030["widgets"][widgets_1.value]["alert_list_config"][alert_list_config_2.value], "active_within_unit", null)
          active_within_value = lookup(local.m_030["widgets"][widgets_1.value]["alert_list_config"][alert_list_config_2.value], "active_within_value", null)
          alert_types         = lookup(local.m_030["widgets"][widgets_1.value]["alert_list_config"][alert_list_config_2.value], "alert_types", null)
          limit_to            = lookup(local.m_030["widgets"][widgets_1.value]["alert_list_config"][alert_list_config_2.value], "limit_to", null)
        }
      }
      dynamic "box_and_whiskers_config" {
        iterator = box_and_whiskers_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "box_and_whiskers_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["box_and_whiskers_config"]))
        content {
          group_by  = lookup(local.m_030["widgets"][widgets_1.value]["box_and_whiskers_config"][box_and_whiskers_config_2.value], "group_by", null)
          max_scale = lookup(local.m_030["widgets"][widgets_1.value]["box_and_whiskers_config"][box_and_whiskers_config_2.value], "max_scale", null)
          min_scale = lookup(local.m_030["widgets"][widgets_1.value]["box_and_whiskers_config"][box_and_whiskers_config_2.value], "min_scale", null)
          unit      = lookup(local.m_030["widgets"][widgets_1.value]["box_and_whiskers_config"][box_and_whiskers_config_2.value], "unit", null)
        }
      }
      dynamic "color_grid_config" {
        iterator = color_grid_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "color_grid_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["color_grid_config"]))
        content {
          cards          = lookup(local.m_030["widgets"][widgets_1.value]["color_grid_config"][color_grid_config_2.value], "cards", null)
          columns        = lookup(local.m_030["widgets"][widgets_1.value]["color_grid_config"][color_grid_config_2.value], "columns", null)
          group_cards_by = lookup(local.m_030["widgets"][widgets_1.value]["color_grid_config"][color_grid_config_2.value], "group_cards_by", null)
          limit          = lookup(local.m_030["widgets"][widgets_1.value]["color_grid_config"][color_grid_config_2.value], "limit", null)
          max_scale      = lookup(local.m_030["widgets"][widgets_1.value]["color_grid_config"][color_grid_config_2.value], "max_scale", null)
          min_scale      = lookup(local.m_030["widgets"][widgets_1.value]["color_grid_config"][color_grid_config_2.value], "min_scale", null)
          unit           = lookup(local.m_030["widgets"][widgets_1.value]["color_grid_config"][color_grid_config_2.value], "unit", null)
        }
      }
      dynamic "filter" {
        iterator = filter_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "filter", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["filter"]))
        content {
          property = lookup(local.m_030["widgets"][widgets_1.value]["filter"][filter_2.value], "property", null)
          values   = lookup(local.m_030["widgets"][widgets_1.value]["filter"][filter_2.value], "values", null)
        }
      }
      dynamic "fixed_timespan" {
        iterator = fixed_timespan_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "fixed_timespan", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["fixed_timespan"]))
        content {
          unit  = lookup(local.m_030["widgets"][widgets_1.value]["fixed_timespan"][fixed_timespan_2.value], "unit", null)
          value = lookup(local.m_030["widgets"][widgets_1.value]["fixed_timespan"][fixed_timespan_2.value], "value", null)
        }
      }
      dynamic "geo_map_config" {
        iterator = geo_map_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "geo_map_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["geo_map_config"]))
        content {
          group_by            = lookup(local.m_030["widgets"][widgets_1.value]["geo_map_config"][geo_map_config_2.value], "group_by", null)
          is_geo_map_per_test = lookup(local.m_030["widgets"][widgets_1.value]["geo_map_config"][geo_map_config_2.value], "is_geo_map_per_test", null)
          max_scale           = lookup(local.m_030["widgets"][widgets_1.value]["geo_map_config"][geo_map_config_2.value], "max_scale", null)
          min_scale           = lookup(local.m_030["widgets"][widgets_1.value]["geo_map_config"][geo_map_config_2.value], "min_scale", null)
          unit                = lookup(local.m_030["widgets"][widgets_1.value]["geo_map_config"][geo_map_config_2.value], "unit", null)
        }
      }
      dynamic "grouped_bar_chart_config" {
        iterator = grouped_bar_chart_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "grouped_bar_chart_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["grouped_bar_chart_config"]))
        content {
          axis_group_by           = lookup(local.m_030["widgets"][widgets_1.value]["grouped_bar_chart_config"][grouped_bar_chart_config_2.value], "axis_group_by", null)
          group_by                = lookup(local.m_030["widgets"][widgets_1.value]["grouped_bar_chart_config"][grouped_bar_chart_config_2.value], "group_by", null)
          is_horizontal_bar_chart = lookup(local.m_030["widgets"][widgets_1.value]["grouped_bar_chart_config"][grouped_bar_chart_config_2.value], "is_horizontal_bar_chart", null)
          limit                   = lookup(local.m_030["widgets"][widgets_1.value]["grouped_bar_chart_config"][grouped_bar_chart_config_2.value], "limit", null)
          show_labels             = lookup(local.m_030["widgets"][widgets_1.value]["grouped_bar_chart_config"][grouped_bar_chart_config_2.value], "show_labels", null)
        }
      }
      dynamic "list_config" {
        iterator = list_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "list_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["list_config"]))
        content {
          active_within_unit  = lookup(local.m_030["widgets"][widgets_1.value]["list_config"][list_config_2.value], "active_within_unit", null)
          active_within_value = lookup(local.m_030["widgets"][widgets_1.value]["list_config"][list_config_2.value], "active_within_value", null)
        }
      }
      dynamic "measure" {
        iterator = measure_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "measure", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["measure"]))
        content {
          percentile_value = lookup(local.m_030["widgets"][widgets_1.value]["measure"][measure_2.value], "percentile_value", null)
          type             = lookup(local.m_030["widgets"][widgets_1.value]["measure"][measure_2.value], "type", null)
        }
      }
      dynamic "multi_metric_columns" {
        iterator = multi_metric_columns_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "multi_metric_columns", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["multi_metric_columns"]))
        content {
          data_source  = lookup(local.m_030["widgets"][widgets_1.value]["multi_metric_columns"][multi_metric_columns_2.value], "data_source", null)
          direction    = lookup(local.m_030["widgets"][widgets_1.value]["multi_metric_columns"][multi_metric_columns_2.value], "direction", null)
          metric       = lookup(local.m_030["widgets"][widgets_1.value]["multi_metric_columns"][multi_metric_columns_2.value], "metric", null)
          metric_group = lookup(local.m_030["widgets"][widgets_1.value]["multi_metric_columns"][multi_metric_columns_2.value], "metric_group", null)
          dynamic "measure" {
            iterator = measure_3
            for_each = lookup(local.m_030["widgets"][widgets_1.value]["multi_metric_columns"][multi_metric_columns_2.value], "measure", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["multi_metric_columns"][multi_metric_columns_2.value]["measure"]))
            content {
              percentile_value = lookup(local.m_030["widgets"][widgets_1.value]["multi_metric_columns"][multi_metric_columns_2.value]["measure"][measure_3.value], "percentile_value", null)
              type             = lookup(local.m_030["widgets"][widgets_1.value]["multi_metric_columns"][multi_metric_columns_2.value]["measure"][measure_3.value], "type", null)
            }
          }
        }
      }
      dynamic "multi_metric_table_config" {
        iterator = multi_metric_table_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "multi_metric_table_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["multi_metric_table_config"]))
        content {
          compare_to_previous_value = lookup(local.m_030["widgets"][widgets_1.value]["multi_metric_table_config"][multi_metric_table_config_2.value], "compare_to_previous_value", null)
          limit                     = lookup(local.m_030["widgets"][widgets_1.value]["multi_metric_table_config"][multi_metric_table_config_2.value], "limit", null)
          row_group_by              = lookup(local.m_030["widgets"][widgets_1.value]["multi_metric_table_config"][multi_metric_table_config_2.value], "row_group_by", null)
        }
      }
      dynamic "number_cards" {
        iterator = number_cards_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "number_cards", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["number_cards"]))
        content {
          compare_to_previous_value                = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "compare_to_previous_value", null)
          data_source                              = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "data_source", null)
          description                              = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "description", null)
          direction                                = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "direction", null)
          max_scale                                = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "max_scale", null)
          metric                                   = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "metric", null)
          metric_group                             = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "metric_group", null)
          min_scale                                = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "min_scale", null)
          should_exclude_alert_suppression_windows = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "should_exclude_alert_suppression_windows", null)
          unit                                     = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "unit", null)
          dynamic "filter" {
            iterator = filter_3
            for_each = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "filter", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value]["filter"]))
            content {
              property = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value]["filter"][filter_3.value], "property", null)
              values   = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value]["filter"][filter_3.value], "values", null)
            }
          }
          dynamic "fixed_timespan" {
            iterator = fixed_timespan_3
            for_each = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "fixed_timespan", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value]["fixed_timespan"]))
            content {
              unit  = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value]["fixed_timespan"][fixed_timespan_3.value], "unit", null)
              value = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value]["fixed_timespan"][fixed_timespan_3.value], "value", null)
            }
          }
          dynamic "measure" {
            iterator = measure_3
            for_each = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value], "measure", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value]["measure"]))
            content {
              percentile_value = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value]["measure"][measure_3.value], "percentile_value", null)
              type             = lookup(local.m_030["widgets"][widgets_1.value]["number_cards"][number_cards_2.value]["measure"][measure_3.value], "type", null)
            }
          }
        }
      }
      dynamic "pie_chart_config" {
        iterator = pie_chart_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "pie_chart_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["pie_chart_config"]))
        content {
          group_by = lookup(local.m_030["widgets"][widgets_1.value]["pie_chart_config"][pie_chart_config_2.value], "group_by", null)
        }
      }
      dynamic "stacked_area_config" {
        iterator = stacked_area_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "stacked_area_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["stacked_area_config"]))
        content {
          group_by  = lookup(local.m_030["widgets"][widgets_1.value]["stacked_area_config"][stacked_area_config_2.value], "group_by", null)
          max_scale = lookup(local.m_030["widgets"][widgets_1.value]["stacked_area_config"][stacked_area_config_2.value], "max_scale", null)
          min_scale = lookup(local.m_030["widgets"][widgets_1.value]["stacked_area_config"][stacked_area_config_2.value], "min_scale", null)
          unit      = lookup(local.m_030["widgets"][widgets_1.value]["stacked_area_config"][stacked_area_config_2.value], "unit", null)
        }
      }
      dynamic "stacked_bar_chart_config" {
        iterator = stacked_bar_chart_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "stacked_bar_chart_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["stacked_bar_chart_config"]))
        content {
          axis_group_by           = lookup(local.m_030["widgets"][widgets_1.value]["stacked_bar_chart_config"][stacked_bar_chart_config_2.value], "axis_group_by", null)
          is_horizontal_bar_chart = lookup(local.m_030["widgets"][widgets_1.value]["stacked_bar_chart_config"][stacked_bar_chart_config_2.value], "is_horizontal_bar_chart", null)
          limit                   = lookup(local.m_030["widgets"][widgets_1.value]["stacked_bar_chart_config"][stacked_bar_chart_config_2.value], "limit", null)
          show_labels             = lookup(local.m_030["widgets"][widgets_1.value]["stacked_bar_chart_config"][stacked_bar_chart_config_2.value], "show_labels", null)
        }
      }
      dynamic "table_config" {
        iterator = table_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "table_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["table_config"]))
        content {
          column_group_by           = lookup(local.m_030["widgets"][widgets_1.value]["table_config"][table_config_2.value], "column_group_by", null)
          compare_to_previous_value = lookup(local.m_030["widgets"][widgets_1.value]["table_config"][table_config_2.value], "compare_to_previous_value", null)
          limit                     = lookup(local.m_030["widgets"][widgets_1.value]["table_config"][table_config_2.value], "limit", null)
          row_group_by              = lookup(local.m_030["widgets"][widgets_1.value]["table_config"][table_config_2.value], "row_group_by", null)
        }
      }
      dynamic "test_table_config" {
        iterator = test_table_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "test_table_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["test_table_config"]))
        content {
          dynamic "exclude" {
            iterator = exclude_3
            for_each = lookup(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value], "exclude", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value]["exclude"]))
            content {
              type = lookup(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value]["exclude"][exclude_3.value], "type", null)
              dynamic "filters" {
                iterator = filters_4
                for_each = lookup(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value]["exclude"][exclude_3.value], "filters", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value]["exclude"][exclude_3.value]["filters"]))
                content {
                  key   = lookup(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value]["exclude"][exclude_3.value]["filters"][filters_4.value], "key", null)
                  value = lookup(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value]["exclude"][exclude_3.value]["filters"][filters_4.value], "value", null)
                }
              }
            }
          }
          dynamic "filter" {
            iterator = filter_3
            for_each = lookup(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value], "filter", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value]["filter"]))
            content {
              type = lookup(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value]["filter"][filter_3.value], "type", null)
              dynamic "filters" {
                iterator = filters_4
                for_each = lookup(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value]["filter"][filter_3.value], "filters", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value]["filter"][filter_3.value]["filters"]))
                content {
                  key   = lookup(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value]["filter"][filter_3.value]["filters"][filters_4.value], "key", null)
                  value = lookup(local.m_030["widgets"][widgets_1.value]["test_table_config"][test_table_config_2.value]["filter"][filter_3.value]["filters"][filters_4.value], "value", null)
                }
              }
            }
          }
        }
      }
      dynamic "timeseries_config" {
        iterator = timeseries_config_2
        for_each = lookup(local.m_030["widgets"][widgets_1.value], "timeseries_config", null) == null ? [] : range(length(local.m_030["widgets"][widgets_1.value]["timeseries_config"]))
        content {
          group_by                         = lookup(local.m_030["widgets"][widgets_1.value]["timeseries_config"][timeseries_config_2.value], "group_by", null)
          is_timeseries_one_chart_per_line = lookup(local.m_030["widgets"][widgets_1.value]["timeseries_config"][timeseries_config_2.value], "is_timeseries_one_chart_per_line", null)
          max_scale                        = lookup(local.m_030["widgets"][widgets_1.value]["timeseries_config"][timeseries_config_2.value], "max_scale", null)
          min_scale                        = lookup(local.m_030["widgets"][widgets_1.value]["timeseries_config"][timeseries_config_2.value], "min_scale", null)
          show_timeseries_overall_baseline = lookup(local.m_030["widgets"][widgets_1.value]["timeseries_config"][timeseries_config_2.value], "show_timeseries_overall_baseline", null)
          unit                             = lookup(local.m_030["widgets"][widgets_1.value]["timeseries_config"][timeseries_config_2.value], "unit", null)
        }
      }
    }
  }
}
