from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

setup(
    name='pyseqfile',
    version='0.1',
    packages=[
        'pyseqfile'
    ],
    license='MIT',
    url='http://github.com/phelimb/remcdbg',
    description='Pyseqfile is a python wrapper on top of [seq_file](https://github.com/noporpoise/seq_file) which allow for reading multiple sequence file formats.',
    ext_modules=cythonize(
        [Extension("pyseqfile/seqfile", ["pyseqfile/seqfile.pyx"])]),
    install_requires=[
        'cython']
)
