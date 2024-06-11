import sys
import asyncio
import dagger
import os

async def build_and_publish_image(client, os_version, cuda_version, container_type, python_version, username, password):
    # Determine image reference
    container_type_tag = "base" if container_type == "" else "tensorflow" if "tensorflow" in container_type else container_type
    img_ref = f"civo_{os_version}_python_{python_version}_cuda_{cuda_version}_{container_type_tag}"

    # Set up the base container
    base_image = f"ghcr.io/mamba-org/micromamba:{os_version}-cuda-{cuda_version}"

    secret = client.set_secret("password", password)
    container = (
        client.container()
        .from_(base_image)
        .with_user("root")
        .with_workdir("/app")
        .with_exec(["/bin/sh", "-c", f"micromamba install -y -n base -c conda-forge {container_type} python={python_version} && micromamba clean --all --yes && micromamba list"])
        .with_env_variable("MAMBA_DOCKERFILE_ACTIVATE", "1")
        .with_registry_auth(address="ghcr.io", username=username, secret=secret)
    )

    await container.publish(f"ghcr.io/{username}/{img_ref}")

async def main():
    username = os.environ.get("username")
    password = os.environ.get("password")
    os_version = os.environ.get("OS_VERSION")
    cuda_version = os.environ.get("CUDA_VERSION")
    container_type = os.environ.get("CONTAINER_TYPE")
    python_version = os.environ.get("PYTHON_VERSION")

    if not username or not password:
        print("Environment variables 'username' and 'password' are required.")
        return

    async with dagger.Connection(dagger.Config(log_output=sys.stderr)) as client:
        await build_and_publish_image(client, os_version, cuda_version, container_type, python_version, username, password)

if __name__ == "__main__":
    asyncio.run(main())
    print("Images built and published successfully!")
