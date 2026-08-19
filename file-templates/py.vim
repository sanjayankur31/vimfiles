#!/usr/bin/env python3
"""
Enter one line description here.

File:

Copyright 2026 Ankur Sinha
Author: Ankur Sinha <sanjay DOT ankur AT gmail DOT com>
"""

import logging
import colorlog


logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

formatter = colorlog.ColoredFormatter(
    "%(log_color)s%(name)s (%(levelname)s): %(message)s"
)
handler = colorlog.StreamHandler()
handler.setLevel(logging.INFO)
handler.setFormatter(formatter)

logger.addHandler(handler)
