import pandas as pd
import os

# Dynamically get the full path to the processed data folder
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
data_path = os.path.join(project_root, '1. data', 'processed')

# Load datasets using absolute paths
view_history_df = pd.read_csv(os.path.join(data_path, 'view_history_clean.csv'))
users_df = pd.read_csv(os.path.join(data_path, 'users_clean.csv'))

# Confirm it's working
print("View History Rows:", len(view_history_df))
print("Users Rows:", len(users_df))
import pandas as pd
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler

# Load and prepare data
def load_data(file_path):
    try:
        df = pd.read_csv(file_path)
        print(f" Loaded data: {df.shape[0]} rows, {df.shape[1]} columns.")
        return df
    except FileNotFoundError:
        print(f" File not found: {file_path}")
        return None

# Preprocess: Scale relevant features
def preprocess_data(df, features):
    scaler = StandardScaler()
    df_scaled = scaler.fit_transform(df[features])
    return df_scaled

# Run KMeans clustering
def perform_kmeans(scaled_data, n_clusters=3):
    kmeans = KMeans(n_clusters=n_clusters, random_state=42)
    clusters = kmeans.fit_predict(scaled_data)
    return clusters

# Save clustered output
def save_clustered_data(df, cluster_labels, output_path):
    df['cluster'] = cluster_labels
    df.to_csv(output_path, index=False)
    print(f" Clustered data saved to {output_path}")

# Script entry point
if __name__ == "__main__":
    input_path = "1. data/processed/view_history_clean.csv"
    output_path = "1. data/processed/view_history_clustered.csv"
    features = ["watch_duration_min"]

    df = load_data(input_path)
    if df is not None:
        scaled = preprocess_data(df, features)
        labels = perform_kmeans(scaled, n_clusters=3)
        save_clustered_data(df, labels, output_path)