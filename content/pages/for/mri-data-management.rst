MRI Data Management
*******************
:template: asciinema
:save_as: for/mri-data-management.html
:url: /for/mri-data-management.html

.. put heading back when next demo is added
.. Automation and Control of Data Acquisition
.. ##########################################

In MRI research, data typically comes as a set of DICOM files which need to be
first converted to a data format convenient for visualization and analysis,
typically NIfTI. Another step further is to layout and organize the data
according to `BIDS (Brain Imaging Data Structure) <http://bids.neuroimaging.io>`__.
One of the tools available to assist with such conversions is `HeuDiConv
(Heuristic DICOM Converter) <https://github.com/nipy/heudiconv/>`__,
which also has an option to place converted data and pre-generated templates
under DataLad's control. This makes it immediately possible to distribute
collected data across processing infrastructure, track provenance of derived
data, and also updating datasets with more of freshly acquired data while
relying on git's powerful merge mechanisms.

Whenever the data are ready for public sharing, it is a `datalad publish` away,
while also allowing to to easily control and restrict the public release to only
data files which do not carry any possibly subject identifying information
(e.g., non-defaced high-resolution anatomicals).

.. raw:: html

    <asciinema-player src="/asciicast/heudiconv_dicom_to_bids.json" cols="80" rows="24"></asciinema-player>
    <div class='dl-cast-script'><a href="/asciicast/heudiconv_dicom_to_bids.sh">Get the script for this demo</a></div>
