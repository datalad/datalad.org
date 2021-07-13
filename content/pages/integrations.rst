Integrations
************
:save_as: integrations.html
:url: /integrations.html

The paper "`In defense of decentralized research data management
<https://doi.org/10.1515/nf-2020-0037>`__" (dRDM) reviews how requirements
different scientific stakeholders can be addressed by a scalable and uniform
dRDM solution, such as DataLad, which is used as an infrastructure component or
utility in a growing number of services and software packages:

- The `OpenNeuro <https://openneuro.org>`__ data portal uses DataLad for
  logistics, and provides a service to access all datasets on
  the platform as `DataLad datasets via GitHub
  <https://github.com/openneurodatasets>`__. (see `Markiewicz et al., 2021 <openneuro paper>`_)

- DataLad is a supported data provider on the `CBRAIN platform <http://cbrain.mcgill.ca>`__
  at the `McGill Centre for Integrative Neuroscience <http://mcin.ca>`__.

- The DICOM conversion tool `HeuDiConv <https://github.com/nipy/heudiconv>`_ uses
  DataLad to organize and version control its output datasets.

- The `CBBS imaging platform <http://imaging-docs.cbbs.eu/datamanagement>`__
  builds on DataLad to manage data capture, management, and analysis workflows
  for neuroimaging research.

- There is an ongoing collaboration with the `brainlife.io
  <https://brainlife.io>`__ platform to create a unique marketplace that aids
  discoverability and re-use of publicly available datasets. Hundreds of
  DataLad datasets are discoverable and immediately usable via the `BrainLife
  dataset search <https://brainlife.io/datasets>`_.

- In its SGA3 funding period, the `Human Brain Project
  <https://www.humanbrainproject.eu>`__ is supporting developments to establish
  interoperability between DataLad and its `EBRAINS <https://ebrains.eu>`__
  infrastructure.

- The `Virtual Brain Cloud consortium <https://virtualbraincloud-2020.eu>`__
  supports the development of `FAIR
  <https://www.go-fair.org/fair-principles>`__ DataLad-based processing
  workflows and software adaptors for interoperability with its cloud
  infrastructure for biomedical research and clinical decision-making.

- The proposed `NFDI-Neuro consortium <https://nfdi-neuro.de/>`__ to establish
  a national research data infrastructure for neurosciences in Germany builds
  on a DataLad-based technical backbone, the `NFDI-Neuro Common Infrastructure
  (COIN) <https://doi.org/10.1515/nf-2020-0036>`__.

- The `DFG collaborative research center (CRC) 1451 on “Key Mechanisms of Motor
  Control in Health and Disease”
  <https://www.dfg.de/en/service/press/press_releases/2020/press_release_no_49/index.html>`__
  at the University of Cologne (and its partners) uses DataLad as key technology
  for its information management needs.

- DataLad is the data management back-end of the remote monitoring platform
  `JTrack <https://arxiv.org/abs/2101.10091>`__ for collecting data from a
  large number of wearable devices for the purpose of developing digital
  biomarkers for neurological and psychiatric diseases.

- `ReproNim <http://repronim.org>`__ (NIH P41 center) uses and contributes to
  DataLad and its extensions for a number of its projects, such as
  `ReproMan <http://reproman.repronim.org>`__,
  `ReproNim/containers <https://github.com/ReproNim/containers/>`__,
  `TestKraken <https://github.com/ReproNim/testkraken/>`__, etc.

- `TemplateFlow <http://templateflow.github.io/>`__ uses
  DataLad for organization, management, and contributions of teamplates.

- `The Canadian Open Neuroscience Platform (CONP) <https://conp.ca>`__ relies
  on DataLad for all data logistics and management of contributions:
  `conp-dataset <https://github.com/CONP-PCNO/conp-dataset>`__.

- `BRAIN Initiative archive for cellular neurophysiology data (DANDI) <https://dandiarchive.org/>`__
  provides DataLad datasets for all data in the archive: `dandisets <https://github.com/dandi/dandisets>`__.

- The `Courtois NeuroMod <https://www.cneuromod.ca>`__ project on neuronal
  modelling uses DataLad for data management and access.

Select publications describing the DataLad system and its use in specific contexts:

- Halchenko, Y. O., Meyer, K., Poldrack, B., Solanky, D. S., Wagner, A. S.,
  Gors, J., ... & Hanke, M. (2021). `DataLad: distributed system for joint management
  of code, data, and their relationship <https://doi.org/10.21105/joss.03262>`__.
  Journal of Open Source Software, 6(63), 3262.

    Provides a general overview of the system.

- Gautheron, L., Rochat, N., & Cristia, A. (2021).
  `Managing, storing, and sharing long-form recordings and their annotations
  <https://doi.org/10.31234/osf.io/w8trm>`__. PsyArXiv.

    Includes an investigation of DataLad's development process and its features
    regarding the suitability as a basis for a specialized RDM for sensitive
    dayling recordings of speech in children.

- Hanke, M., Pestilli, F., Wagner, A. S., Markiewicz, C. J., Poline, J. B., &
  Halchenko, Y. O. (2021). `In defense of decentralized research data
  management <https://doi.org/10.1515/nf-2020-0037>`__. Neuroforum, 27(1), 17-25.

    Illustrates the use of a decentralized RDM solution like DataLad in four
    scenarios: one laboratory or researcher, a research institute, a domain
    data archive or computing platform, and a collaborative multisite consortium

- Markiewicz, C. J., Gorgolewski, K. J., Feingold, F., Blair, R.,
  Halchenko, Y. O., Miller, E., ... & Poldrack, R. (2021).
  `OpenNeuro: An open resource for sharing of neuroimaging data <openneuro paper>`_.
  bioRxiv.

    Describes how the OpenNeuro data portal employes DataLad as a backend and
    user-facing tool.

DataLad and its datasets are compatible with a number of existing portals and
storage solutions:

- DataLad datasets can be hosted on `GIN <https://gin.g-node.org>`__, and any
  data hosted on GIN can be `accessed via DataLad
  <http://handbook.datalad.org/r.html?GIN>`__. Moreover, the GIN service is
  also available for `local deployment
  <https://gin.g-node.org/G-Node/Info/wiki/InHouse>`__, offering a convenient,
  in-house storage back-end and web UI for DataLad datasets.

- With the `datalad-osf extension package
  <https://github.com/datalad/datalad-osf>`__, DataLad datasets, with all
  data file content and version history, can be hosted on the Open Science
  Framework (`example study <https://osf.io/gfrme>`__).

- The `datalad-ukbiobank extension package
  <https://github.com/datalad/datalad-ukbiobank>`__ represents `UK Biobank
  <https://www.ukbiobank.ac.uk>`__ data as extensible DataLad datasets that can
  monitor future updates.

- DataLad datasets can be hosted (without git-annex'ed data) on **any**
  Git hosting portal such as `GitHub <https://github.com>`_ and
  `GitLab <http://gitlab.com>`_.

- DataLad datasets can be "linked" to a wide range of data hosting
  portals (e.g., AWS S3 and Glacier, Box.com and `many others
  <https://git-annex.branchable.com/special_remotes/>`__) to offload
  data online.


.. _OpenNeuro paper: https://doi.org/10.1101/2021.06.28.450168
