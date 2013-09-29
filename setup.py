from setuptools import setup, find_packages

setup(
    name='collective.usermanual',
    version='1.0.0',
    description="Plone 4 User Documentation",
    # Get more strings from
    # http://www.python.org/pypi?%3Aaction=list_classifiers
    classifiers=[
        "Programming Language :: Python",
    ],
    keywords='',
    author='Plone Community',
    author_email='',
    url='https://github.com/collective/collective.usermanual/',
    license='GPL',
    packages=find_packages('src', exclude=['ez_setup']),
    namespace_packages=['collective'],
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        'setuptools',
        'plone.api',
        'plone.app.robotframework[speak]',
        'sphinxcontrib-robotframework[docs]',
    ]
)
