Reproducible Science
********************
:template: asciinema
:save_as: for/reproducible-science.html
:url: /for/reproducible-science.html

DataLad is an ideal tool for conducting reproducible science. It can track and
`obtain shared data <#for-data-consumers>`__ and `publish results
<#data-sharing>`__. Importantly, it jointly manages both analysis input
data and the associated analysis code --- critical to reproduce any analysis.
Lastly, DataLad is able to temporally capture the exact commands used to
produce the results.

All together, DataLad can automatically create an extensive provenance record,
with all the information necessary to rerun an analysis from beginning to end
and demonstrate reproducibility.

Here is a quick demo of how DataLad captures the results derived from input
data. Scroll further down for a more in-depth demo of a full analysis.

.. raw:: html

    <asciinema-player src="/asciicast/simple_provenance_tracking.json" cols="80" rows="24"></asciinema-player>
    <div class='dl-cast-script'><a href="/asciicast/simple_provenance_tracking.sh">Get the script for this demo</a></div>

The next demo shows the complete setup, execution, and replication of a brain
imaging analysis on real data — in just five minutes. You'll see how easy it is
to automatically yield a reproducible outcome. It also demonstrates how DataLad
helps to maintain a strict separation of inputs and outputs to clearly identify
what needs to be archived alongside a publication.

.. raw:: html

    <asciinema-player src="/asciicast/reproducible_analysis.json" cols="80" rows="24"></asciinema-player>
    <div class='dl-cast-script'><a href="/asciicast/reproducible_analysis.sh">Get the script for this demo</a></div>
