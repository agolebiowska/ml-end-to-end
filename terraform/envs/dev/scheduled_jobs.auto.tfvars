/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

cloud_schedulers_config = {

  tensorflow_training = {
    name         = "tensorflow-training-pipeline-trigger"
    description  = "Trigger my TensorFlow training pipeline in Vertex"
    schedule     = "0 0 * * 0"
    time_zone    = "UTC"
    template_path = "gs://development-412000-pl-assets/test/training/training.json"
    enable_caching = null
    pipeline_parameters = {
      project_id = "development-412000"
      project_location = "us-central1"
      pipeline_files_gcs_path = "gs://development-412000-pl-assets/test"
      ingestion_project_id = "development-412000"
      model_name = "tensorflow_with_preprocessing"
      model_label = "test_model"
      tfdv_schema_filename = "tfdv_schema_training.pbtxt"
      tfdv_train_stats_path = "gs://development-412000-pl-root/train_stats/train.stats"
      dataset_id = "preprocessing"
      dataset_location = "us-central1"
      ingestion_dataset_id = "chicago_taxi_trips"
      timestamp = "2024-01-22 00:00:00"
    },
  },

  tensorflow_prediction = {
    name         = "tensorflow-prediction-pipeline-trigger"
    description  = "Trigger my TensorFlow prediction pipeline in Vertex"
    schedule     = "0 0 * * 0"
    time_zone    = "UTC"
    template_path = "gs://development-412000-pl-assets/test/prediction/prediction.json"
    enable_caching = null
    pipeline_parameters = {
      project_id = "development-412000"
      project_location = "us-central1"
      pipeline_files_gcs_path = "gs://development-412000-pl-assets/test"
      ingestion_project_id = "development-412000"
      model_name = "tensorflow_with_preprocessing"
      model_label = "test_model"
      tfdv_schema_filename = "tfdv_schema_training.pbtxt"
      tfdv_train_stats_path = "gs://development-412000-pl-root/train_stats/train.stats"
      dataset_id = "preprocessing"
      dataset_location = "us-central1"
      ingestion_dataset_id = "chicago_taxi_trips"
      timestamp = "2024-01-22 00:00:00"
      batch_prediction_machine_type = "n1-standard-4"
      batch_prediction_min_replicas = 3
      batch_prediction_max_replicas = 5
    },
  },
}
