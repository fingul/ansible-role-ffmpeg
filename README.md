ansible-role-ffmpeg
=========

install ffmpeg to /usr/local/bin

Requirements
------------

64bit linux

BUILD
--------------

    #docker build --no-cache --tag=sffmpeg-build .
    docker build --tag=sffmpeg-build .
    docker run -v `pwd`/files:/ffmpeg-bin sffmpeg-build

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - fingul.ffmpeg

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
