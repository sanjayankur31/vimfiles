#!/usr/bin/env python3
"""
Enter one line description here.

File:

Copyright 2026 Ankur Sinha
Author: Ankur Sinha <sanjay DOT ankur AT gmail DOT com>
"""

import logging


logging.basicConfig(format="%(name)s (%(levelname)s) >>> %(message)s\n", level=logging.WARNING)

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
