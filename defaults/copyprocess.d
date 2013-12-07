//          Copyright Ferdinand Majerech 2013.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)


/// A dummy process template that preserves a component into future.
module tharsis.defaults.copyprocess;

import tharsis.entity.componenttypeinfo;


/// A dummy process template that preserves components of a normal component 
/// type into future.
///
/// All this process does is that it copies the component of specified type into
/// future state, ensuring the component does not disappear.
class CopyProcess(ComponentType)
    if(!isMultiComponent!ComponentType)
{
    mixin validateComponent!ComponentType;

public:
    /// FutureComponent of this process is the copied component type.
    alias ComponentType FutureComponent;

    /// Takes a past components and copies it to a future version.
    void process(ref immutable(ComponentType) past, out ComponentType future)
    {
        future = past;
    }
}

/// A dummy process template that preserves components of a multi component type
/// into future.
///
/// All this process does is that it copies the components of specified type 
/// into future state, ensuring the components do not disappear.
class CopyProcess(ComponentType)
    if(isMultiComponent!ComponentType)
{
public:
    /// FutureComponent of this process is the copied component type.
    alias ComponentType FutureComponent;

    /// Takes a past components and copies it to a future version.
    void process(immutable ComponentType[] past,
                 ref ComponentType[] future)
    {
        future   = future[0 .. past.length];
        future[] = past[];
    }
}

