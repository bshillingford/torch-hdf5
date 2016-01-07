import h5py
f = h5py.File('scalarStrings.h5','w')
dset = f.create_dataset('str', data="hello this is a string!")
dset = f.create_dataset('pi', data=3.1415)
dset = f.create_dataset('int', data=123)
f.close()
