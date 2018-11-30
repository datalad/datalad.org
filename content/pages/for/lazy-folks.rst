Just two commands to get started
********************************
:save_as: for/lazy-folks.html
:url: /for/lazy-folks.html

DataLad can do many things, but one does not need to know everything about it
in order to make use of it. An `extension package
<http://docs.datalad.org/projects/revolution>`_ equips DataLad with a a set of
just *two* commands that cover the most common scenarios for turning one's own
data from a pile of files into a structured dataset that tracks the evolution
of its content. This makes the life of novice users easier, but even Git pros
might feel tempted to get a little lazy ... just sometimes. The extension is
available for installation on Linux/Mac/Windows from `GitHub
<https://github.com/datalad/datalad-revolution>`_, and here is what it does.

1. `rev-create` (make a new dataset)
====================================

This command creates a new dataset. It is best run in an empty directory, or
a name for the new dataset is given, and a fresh directory will be created. To
create a new dataset called "myproject" run:

   ``datalad rev-create myproject``

Datasets can be created anywhere and for any purpose. One can also create
datasets inside other datasets to link them together, for example, input data and
results, or several studies that are part of a bigger project.


2. `rev-save` (record dataset state)
====================================

This THE command. Whenever there was any change in a dataset (e.g. files/datasets
were added, modified or removed) just run

   ``datalad rev-save``

in the dataset to record the new state. Each such record can be used to restore
a previous state (sometimes things go wrong and time-travel becomes really
useful!), or even to compare changes between states. These are already advanced
scenarios, but just running ``rev-save`` whenever some milestone was reached
is all that is needed to make them possible.

It is extremely useful to leave notes for one's future self that help understand
why a change was made. A *message* option can be used to annotate a record
with such information.

   ``datalad rev-save --message "Computed final results for paper submission"``

These two commands are all that is needed to start managing own data with
DataLad. Check out other `demos <../features>`__ and the `full documentation
<http://docs.datalad.org>`_ to learn what more DataLad has to offer.
