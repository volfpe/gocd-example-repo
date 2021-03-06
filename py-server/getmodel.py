from mlflow.tracking import MlflowClient
import mlflow
import os

remote_server_uri = "https://mlflow.mlo.volf.dev"
mlflow.set_tracking_uri(remote_server_uri)
mlflow.set_experiment("/nlg2")

def main():
    print(os.environ)
    print('MODEL VERSION: ' + os.environ.get('MODEL_VERSION'))
    client = MlflowClient()
    client.download_artifacts(os.environ.get('MODEL_VERSION'), "model", '.')

if __name__ == "__main__":
    main()