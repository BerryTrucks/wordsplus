/* Copyright (c) 2012 Research In Motion Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "Global.hpp"

static Global* _pinstance = NULL;

Global* Global::instance() {
    if (_pinstance == NULL) {
        _pinstance = new Global();
    }
    return _pinstance;
}

bb::platform::bbm::Context* Global::getContext() {
	return m_context;
}

void Global::setContext(bb::platform::bbm::Context *context) {
	m_context = context;
}

bool Global::getIsInternetAvailable() {
	return isInternetAvailable;
}

void Global::setIsInternetAvailable(bool isAvailable) {
	isInternetAvailable = isAvailable;
}
