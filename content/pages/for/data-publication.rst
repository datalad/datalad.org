Data Publication
****************
:template: asciinema
:save_as: for/data-publication.html
:url: /for/data-publication.html

Publishing or sharing data, code, and results is a key element of the
scientific process.  Sharing comes in many flavors, for example:

1) sharing with yourself, and having certainty that the copy on your laptop
   matches what you have been working with on your workstation;
2) sharing with colleagues, and making sure they all know when data changed and
   which results have to be recomputed; and
3) sharing with the world, to make sure that your work has maximum impact.

DataLad aids many types of sharing efforts. It supports synchronization of
multiple instances of a dataset belonging to a single person. It provides
on-demand updates of datasets shared with local or remote collaborators. It
offers a wide variety of publications methods, ranging from a (cloud) server,
to services such as GitHub, DropBox, or box.com.

Here is a demo of using DataLad with a cloud storage service. This combination
allows for convenient data exchange between colleagues, or simple data
synchronization between the machines of a single person.

.. raw:: html

    <asciinema-player src="/asciicast/boxcom.json" cols="80" rows="24"></asciinema-player>
    <div class='dl-cast-script'><a href="/asciicast/boxcom.sh">Get the script for this demo</a></div>

Most cloud storage services are not ideal for data sharing with the general public,
because they require a file or directory to be shared with particular accounts
of that service provider. An SSH-accessible web server does not have these limitation,
and is equally well supported by DataLad. Here is a demo that shows how one can publish
large data "on GitHub" for maximum visibility, and configure DataLad to transparently
obtain all data files from a different web server.

.. raw:: html

    <asciinema-player src="/asciicast/publish_on_github.json" cols="80" rows="24"></asciinema-player>
    <div class='dl-cast-script'><a href="/asciicast/publish_on_github.sh">Get the script for this demo</a></div>
