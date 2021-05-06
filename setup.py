from setuptools import find_packages, setup

setup(
    name="myapp",
    version="0.1",
    packages=find_packages(),
    description="A sample package",
    install_requires=['pyrobuf'],
    setup_requires=['pyrobuf'],
    pyrobuf_modules="proto",
    entry_points={
        "console_scripts": [
            "myapp = myapp.__main__:main"
        ]
    },
)