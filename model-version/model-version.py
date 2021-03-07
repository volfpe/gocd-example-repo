from mlflow.tracking import MlflowClient
import mlflow
import os

remote_server_uri = "https://mlflow.mlo.volf.dev"
mlflow.set_tracking_uri(remote_server_uri)
mlflow.set_experiment("/nlg2")

def main():
    client = MlflowClient()
    for rm in client.list_registered_models():
        for version in dict(rm)['latest_versions']:
            if dict(version)['current_stage'] == 'Production':
                print(dict(version)['run_id'], end='')

if __name__ == "__main__":
    main()